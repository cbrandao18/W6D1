require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    # describe "GET #show" do
    #     it "renders the show template" do
    #         get :show, params: { id: user.id }
    #         exp
    describe "POST #create" do
        context "with invalid params" do
            it "validates the presence of the user's username and password" do
                post :create, params: { user: {username: "jack_bruce@place.com", password: ""} }
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end

            it "validates that the password is at least 6 characters long" do
                post :create, params: { user: { username: "jack_bruce@place.com", password: "short" } }
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present
            end
        end

        context "with valid params" do
            it "redirects user to sign-in page on success" do
                post :create, params: { user: { username: "jack_bruce@place.com", password: "password" } }
                expect(response).to redirect_to(new_session_url)
            end
        end
    end
end
