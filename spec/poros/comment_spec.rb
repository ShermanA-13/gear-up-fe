require 'rails_helper'

describe 'Comment poro' do
  before do
    user_1_attr = { id: 1, type: 'user',
                    attributes: {
                      first_name: 'Gandalf',
                      last_name: 'DaGrey',
                      email: 'user_1@gearup.test',
                      user_photo: 'https://lh3.googleusercontent.com/a-/AOh14GjhYI5RIF0qkDbiUtgXjH59K7hoEZ1QpLykFsEh2g=s96-c'
                    } }
    @user_1 = User.new(user_1_attr)

    comm_1_attr = {
      attributes: {
        user_name: "#{@user_1.first_name} #{@user_1.last_name}",
        user_id: @user_1.id,
        user_photo: @user_1.user_photo,
        created_at: '2022-06-29T21:22:14.260Z',
        message: 'This is going to be awesome!'
      }
    }

    comm_2_attr = {
      attributes: {
        user_name: "#{@user_1.first_name} #{@user_1.last_name}",
        user_id: @user_1.id,
        user_photo: @user_1.user_photo,
        created_at: '2022-06-30T21:22:22.260Z',
        message: "Don't forget the water!"
      }
    }

    @comment_1 = Comment.new(comm_1_attr)
    @comment_2 = Comment.new(comm_2_attr)
  end

  it 'exists and has attributes' do
    expect(@comment_1).to be_a(Comment)
    expect(@comment_1.user_name).to eq('Gandalf DaGrey')
    expect(@comment_1.user_id).to eq(@user_1.id)
    expect(@comment_1.user_photo).to eq(@user_1.user_photo)
    expect(@comment_1.created_at).to eq('09:22:14 PM on Jun 29, 2022')
    expect(@comment_1.message).to eq('This is going to be awesome!')

    expect(@comment_2).to be_a(Comment)
    expect(@comment_2.user_name).to eq('Gandalf DaGrey')
    expect(@comment_2.user_id).to eq(@user_1.id)
    expect(@comment_2.user_photo).to eq(@user_1.user_photo)
    expect(@comment_2.created_at).to eq('09:22:22 PM on Jun 30, 2022')
    expect(@comment_2.message).to eq("Don't forget the water!")
  end

  describe 'methods' do
    it '.timestamp' do
      date_time = {
        attributes: {
          created_at: '2023-08-12T21:22:14.260Z'
        }
      }

      expect(@comment_1.timestamp(date_time)).to eq('09:22:14 PM on Aug 12, 2023')
    end
  end
end
