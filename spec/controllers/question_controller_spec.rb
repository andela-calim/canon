require 'rails_helper'

describe QuestionsController, type: :controller do
  describe 'methods allowed for user' do
    let(:questions) { create(:questions) }

    describe '#new' do
      it 'assigns a new question' do
        get :new
        expect(assigns(:questions)).to be_a_new(Question)
      end

    end
  end

end