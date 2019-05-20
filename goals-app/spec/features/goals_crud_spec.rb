require 'rails_helper'

feature "CRUD of goals" do
  given!(:hello_world) { FactoryBot.create(:user_hw) }

  background(:each) do
    login_as(hello_world)
  end

  feature "creating goals" do
    scenario "should have a page for creating a new goal" do
      visit new_goal_url
      expect(page).to have_content "New Goal"
    end

    scenario "should show the new goal after creation" do
      submit_new_goal("have some toes", "and some fingers")
      expect(page).to have_content "have some toes"
      expect(page).to have_content "and some fingers"
      expect(page).to have_content "Your goal was created"
    end
  end

  feature "reading goals" do
    scenario "should list goals" do
      build_three_goals(hello_world)
      verify_three_goals
    end
  end

  feature "updating goals" do
    given(:goal) { FactoryBot.create(:goal, user: hello_world) }

    scenario "should have a page for updating an existing goal" do
      visit edit_goal_url(goal)
      expect(page).to have_content "Edit Goal"
      expect(find_field('Title').value).to eq(goal.title)
    end
  end
end
