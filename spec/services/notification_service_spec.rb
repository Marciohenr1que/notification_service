require 'rails_helper'

RSpec.describe Services::NotificationService, type: :service do
  subject { Services::NotificationService.create_notification(notification_params) }

  before do
    @notification_params = attributes_for(:user_notification)
  end

  let(:notification_params) { @notification_params }

  context 'quando a notificação é criada com sucesso' do
    before do
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
      allow(Notifications::CreateNotification).to receive(:call).with(notification_params).and_return({ success: false, message: 'Erro de Teste' })
    end

    it 'retorna falha' do
      resultado = subject

      expect(resultado[:success]).to be_falsey
      expect(resultado[:message]).to eq('Erro de Teste')
    end
  end
end