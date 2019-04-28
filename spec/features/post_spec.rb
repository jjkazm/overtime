require 'rails_helper'

describe 'posts' do
  describe 'index' do
    it 'can be reached succesfully' do
      visit posts_path
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Post' do
      visit posts_path
      expect(page).to have_content("Posts")
    end
  end
  describe 'creation' do
    before do
      @user = create(:user)
      login_as @user
      visit new_post_path
    end
    it 'can display new post form' do
      expect(page.status_code).to eq(200)
    end
    it 'can can create new post' do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"
      click_on 'Save'

      expect(page).to have_content('Some rationale')
    end
    it 'is associated to logged user' do
      fill_in "post[date]", with: Date.today
      fill_in "post[rationale]", with: "Some rationale"
      click_on 'Save'

      expect(Post.last.user).to eq(@user)

    end
  end
end
