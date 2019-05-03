require 'rails_helper'

describe 'posts' do
  before do
    @user = create(:user)
    login_as @user
  end
  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end
    it 'has a title of Post' do
      expect(page).to have_content("Posts")
    end

    it 'has list of posts' do
      post1 = create(:post, rationale: "Post1", user_id: @user.id)
      post2 = create(:post, rationale: "Post2", user_id: @user.id)
      visit posts_path
      expect(page).to have_content("Post1")
      expect(page).to have_content("Post2")
    end
  end
  describe 'creation' do
    before do
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

  describe 'edit' do
    before do
      post = create(:post)
      visit posts_path
      click_link("edit_#{post.id}")
    end
    it 'can be reached by clicking edit button' do
      expect(page.status_code).to eq(200)
    end
    it 'can be edited' do
      fill_in "post[rationale]", with: "Edited rationale"
      click_on 'Save'

      expect(page).to have_content("Edited rationale")
    end
  end
end
