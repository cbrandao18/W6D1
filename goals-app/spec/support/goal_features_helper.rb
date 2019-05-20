module GoalFeaturesHelper
  def submit_new_goal(goal_title, goal_body, public = {public: false})
    visit new_goal_url
    fill_in "Title", with: goal_title
    fill_in "Body", with: goal_body
    if public[:public]
      check "Public?"
    end
    click_button "New Goal"
  end

  def build_three_goals(user)
    FactoryBot.create(:goal, title: "pickle a pepper", body: "body1", user_id: user.id)
    FactoryBot.create(:goal, title: "get octocat's autograph", body: "body2", user_id: user.id)
    FactoryBot.create(:goal, title: "bake a cake", body: "body3", user_id: user.id)
  end

  def verify_three_goals
    visit goals_url
    expect(page).to have_content "pickle a pepper"
    expect(page).to have_content "get octocat's autograph"
    expect(page).to have_content "bake a cake"
    expect(page).to have_content "body1"
    expect(page).to have_content "body2"
    expect(page).to have_content "body3"
  end
end
