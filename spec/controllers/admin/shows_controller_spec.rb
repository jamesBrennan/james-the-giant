require 'spec_helper'

describe Admin::ShowsController do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Show. As you add validations to Admin::Show, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    attributes_for :show
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::ShowsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  before do
    # TODO Set to :user and specify authorization rules in Ability.rb.
    # login_user build :admin
  end

  describe "#index" do
    it "assigns all admin_shows as @admin_shows" do
      show = Admin::Show.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:admin_shows)).to eq([show])
    end
  end

  describe "#show" do
    it "assigns the requested admin_show as @admin_show" do
      show = Admin::Show.create! valid_attributes
      get :show, { :id => show.to_param }, valid_session
      expect(assigns(:admin_show)).to eq(show)
    end
  end

  describe "#new" do
    it "assigns a new admin_show as @admin_show" do
      get :new, {}, valid_session
      expect(assigns(:admin_show)).to be_a_new(Admin::Show)
    end
  end

  describe "#edit" do
    it "assigns the requested admin_show as @admin_show" do
      show = Admin::Show.create! valid_attributes
      get :edit, { :id => show.to_param }, valid_session
      expect(assigns(:admin_show)).to eq(show)
    end
  end

  describe "#create" do
    describe "with valid params" do
      it "creates a new Admin::Show" do
        expect {
          post :create, { :admin_show => valid_attributes }, valid_session
        }.to change(Admin::Show, :count).by(1)
      end

      it "assigns a newly created admin_show as @admin_show" do
        post :create, {:admin_show => valid_attributes }, valid_session
        expect(assigns(:admin_show)).to be_a(Admin::Show)
        expect(assigns(:admin_show)).to be_persisted
      end

      it "redirects to the created admin_show" do
        post :create, { :admin_show => valid_attributes }, valid_session
        expect(response).to redirect_to(Admin::Show.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_show as @admin_show" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Show.any_instance.stub(:save).and_return(false)
        post :create, { :admin_show => { "date" => "invalid value" } }, valid_session
        expect(assigns(:admin_show)).to be_a_new(Admin::Show)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Show.any_instance.stub(:save).and_return(false)
        post :create, { :admin_show => { "date" => "invalid value" } }, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "#update" do
    describe "with valid params" do
      it "updates the requested admin_show" do
        show = Admin::Show.create! valid_attributes
        # Assuming there are no other admin_shows in the database, this
        # specifies that the Admin::Show created on the previous line
        # receives the :update message with whatever params are submitted in
        # the request.
        Admin::Show.any_instance.should_receive(:update).with({ "date" => "2014-05-28" })
        put :update, { :id => show.to_param, :admin_show => { "date" => "2014-05-28" } }, valid_session
      end

      it "assigns the requested admin_show as @admin_show" do
        show = Admin::Show.create! valid_attributes
        put :update, { :id => show.to_param, :admin_show => valid_attributes }, valid_session
        expect(assigns(:admin_show)).to eq(show)
      end

      it "redirects to the admin_show" do
        show = Admin::Show.create! valid_attributes
        put :update, { :id => show.to_param, :admin_show => valid_attributes }, valid_session
        expect(response).to redirect_to(show)
      end
    end

    describe "with invalid params" do
      it "assigns the admin_show as @admin_show" do
        show = Admin::Show.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Show.any_instance.stub(:save).and_return(false)
        put :update, { :id => show.to_param, :admin_show => { "date" => "invalid value" } }, valid_session
        expect(assigns(:admin_show)).to eq(show)
      end

      it "re-renders the 'edit' template" do
        show = Admin::Show.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Admin::Show.any_instance.stub(:save).and_return(false)
        put :update, { :id => show.to_param, :admin_show => { "date" => "invalid value" } }, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "#destroy" do
    it "destroys the requested admin_show" do
      show = Admin::Show.create! valid_attributes
      expect {
        delete :destroy, { :id => show.to_param }, valid_session
      }.to change(Admin::Show, :count).by(-1)
    end

    it "redirects to the admin_shows list" do
      show = Admin::Show.create! valid_attributes
      delete :destroy, { :id => show.to_param }, valid_session
      expect(response).to redirect_to(admin_shows_url)
    end
  end

end
