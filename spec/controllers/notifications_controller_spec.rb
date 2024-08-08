require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do
  let(:valid_attributes) { { task_id: '777', task_title: 'Maiores illum eum occaecati.', task_description: 'Assumenda corporis nostrum. Sit est ducimus. Ea aut aspernatur.', user_id: '745', user_email: 'abdul_nikolaus@schmidt.example', action: 'create' } }
  let(:invalid_attributes) { { task_id: '', task_title: '', task_description: '', user_id: '', user_email: '', action: 'create' } }

  describe 'POST #create' do
    context 'com atributos válidos' do
      before do
        allow(Services::NotificationService).to receive(:create_notification).with(valid_attributes).and_return({ success: true, message: 'Notification received' })
      end

      it 'retorna uma resposta bem-sucedida' do
        post :create, params: valid_attributes
        expect(response).to have_http_status(:created)
      end

      it 'retorna a mensagem de sucesso' do
        post :create, params: valid_attributes
        expect(JSON.parse(response.body)['message']).to eq('Notification received and saved')
      end
    end

    context 'com atributos inválidos' do
      before do
        allow(Services::NotificationService).to receive(:create_notification).with(invalid_attributes).and_return({ success: false, message: 'Failed to save notification' })
      end

      it 'não cria uma nova notificação' do
        expect {
          post :create, params: invalid_attributes
        }.not_to change(UserNotification, :count)
      end

      it 'retorna uma resposta com falha' do
        post :create, params: invalid_attributes
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'retorna a mensagem de erro' do
        post :create, params: invalid_attributes
        expect(JSON.parse(response.body)['message']).to eq('Failed to save notification')
      end
    end
  end
end
