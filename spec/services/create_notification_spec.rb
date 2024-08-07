require 'rails_helper'

RSpec.describe Notifications::CreateNotification, type: :service do
  # Configuração do `subject`
  subject { Notifications::CreateNotification.new(notification_params).call }

  # Configuração do `before`
  before do
    @notification_params = attributes_for(:user_notification)
  end

  let(:notification_params) { @notification_params }

  context 'quando a notificação é criada com sucesso' do
    it 'retorna sucesso' do
      resultado = subject

      expect(resultado[:success]).to be_truthy
      expect(resultado[:message]).to eq('Notification received')
      expect(UserNotification.last.action).to eq(notification_params[:action])
    end
  end

  context 'quando ocorre um erro ao criar a notificação' do
    before do
      # Simula uma falha ao criar a notificação
      allow(UserNotification).to receive(:create!).and_raise(StandardError.new("Erro de Teste"))
    end

    it 'retorna falha' do
      resultado = subject

      expect(resultado[:success]).to be_falsey
      expect(resultado[:message]).to eq('Erro de Teste')
    end
  end
end
