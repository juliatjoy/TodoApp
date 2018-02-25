require 'rails_helper'

describe Todo, type: :model do
  let(:todo) { build(:todo) }

  describe 'Create active todo' do
    it 'is to create with status active' do
      todo.status = 'active'
      expect(todo).to be_valid
    end
  end

  describe 'Create completed todo' do
    it 'is to create with status completed' do
      todo.status = 'completed'
      expect(todo).to be_valid
    end
  end

end
