require "application_system_test_case"

class DuplicatedPostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit duplicated_posts_url
    assert_selector "h1", text: "Posts"
  end

  test "creating a Post" do
    visit duplicated_posts_url
    click_on "New Post"

    fill_in "Title", with: "New Post Title"
    fill_in "Body", with: "New Post Body"
    click_on "Create Post"

    assert_text "Post was successfully created."
    assert_text "New Post Title"
    assert_text "New Post Body"
  end

  test "updating a Post" do
    visit duplicated_post_url(@post)
    click_on "Edit", match: :first

    fill_in "Title", with: "Updated Post Title"
    fill_in "Body", with: "Updated Post Body"
    click_on "Update Post"

    assert_text "Post was successfully updated."
    assert_text "Updated Post Title"
    assert_text "Updated Post Body"
  end

  test "destroying a Post" do
    visit duplicated_post_url(@post)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Post was successfully destroyed."
  end
end