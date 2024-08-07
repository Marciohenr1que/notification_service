require 'rails_helper'

RSpec.describe NotificationService, type: :service do
  # Configuração do `subject`
  subject { NotificationService.create_notification(notification_params) }

  # Configuração do `before`
  before do
    @notification_params = attributes_for(:user_notification)
  end

  let(:notification_params) { @notification_params }

  context 'quando a notificação é criada com sucesso' do
    before do
      # Configura o stub para o serviço Notifications::CreateNotification
      allow(Notifications::CreateNotification).to receive(:call).with(notification_params).and_return({ success: true, message: 'Notification received' })
    end

    it 'retorna sucesso' do
      resultado = subject

      expect(resultado[:success]).to be_truthy
      expect(resultado[:message]).to eq('Notification received')
    end
  end

  context 'quando ocorre um erro ao criar a notificação' do
    before do
      # Simula uma falha ao criar a notificação
      allow(Notifications::CreateNotification).to receive(:call).with(notification_params).and_return({ success: false, message: 'Erro de Teste' })
    end

    it 'retorna falha' do
      resultado = subject

      expect(resultado[:success]).to be_falsey
      expect(resultado[:message]).to eq('Erro de Teste')
    end
  end
end
