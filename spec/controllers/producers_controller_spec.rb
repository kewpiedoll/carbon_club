require 'spec_helper'

describe ProducersController do

  # This should return the minimal set of attributes required to create a valid
  # Producer. As you add validations to Producer, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { user_name: "Chris",
                             full_name: "Chris A",
                             re_system_type: "2",
                             init_kwh_reading: "1910",
                             email: "biodieselchris@gmail.com",
                             password: 'qqqwwweee',
                             password_confirmation: 'qqqwwweee',
                             confirmed_at: Time.now} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProducersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all producers as @producers" do
      producer = Producer.create! valid_attributes
      sign_in producer
      get :index, {}, valid_session
      assigns(:producers).should eq([producer])
    end
  end

  describe "GET show" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      sign_in producer
      get :show, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "GET new" do
    it "assigns a new producer as @producer" do
      #
      sign_in producer
      get :new, {}, valid_session
      assigns(:producer).should be_a_new(Producer)
    end
  end

  describe "GET edit" do
    it "assigns the requested producer as @producer" do
      producer = Producer.create! valid_attributes
      sign_in producer
      get :edit, {:id => producer.to_param}, valid_session
      assigns(:producer).should eq(producer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Producer" do
        #sign_in producer
        expect {
          post :create, {:producer => valid_attributes}, valid_session
        }.to change(Producer, :count).by(1)
      end

      it "assigns a newly created producer as @producer" do
        post :create, {:producer => valid_attributes}, valid_session
        assigns(:producer).should be_a(Producer)
        assigns(:producer).should be_persisted
      end

      it "redirects to the created producer" do
        post :create, {:producer => valid_attributes}, valid_session
        response.should redirect_to(Producer.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved producer as @producer" do
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => { "user_name" => "invalid value" }}, valid_session
        assigns(:producer).should be_a_new(Producer)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        post :create, {:producer => { "user_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested producer" do
        producer = Producer.create! valid_attributes
        # Assuming there are no other producers in the database, this
        # specifies that the Producer created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Producer.any_instance.should_receive(:update).with({ "user_name" => "MyString" })
        put :update, {:id => producer.to_param, :producer => { "user_name" => "MyString" }}, valid_session
      end

      it "assigns the requested producer as @producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "redirects to the producer" do
        producer = Producer.create! valid_attributes
        put :update, {:id => producer.to_param, :producer => valid_attributes}, valid_session
        response.should redirect_to(producer)
      end
    end

    describe "with invalid params" do
      it "assigns the producer as @producer" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => { "user_name" => "invalid value" }}, valid_session
        assigns(:producer).should eq(producer)
      end

      it "re-renders the 'edit' template" do
        producer = Producer.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Producer.any_instance.stub(:save).and_return(false)
        put :update, {:id => producer.to_param, :producer => { "user_name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested producer" do
      producer = Producer.create! valid_attributes
      expect {
        delete :destroy, {:id => producer.to_param}, valid_session
      }.to change(Producer, :count).by(-1)
    end

    it "redirects to the producers list" do
      producer = Producer.create! valid_attributes
      delete :destroy, {:id => producer.to_param}, valid_session
      response.should redirect_to(producers_url)
    end
  end
end

describe "Producers 2" do

  subject { page }

  describe "profile page" do
    let(:producer) { FactoryGirl.create(:producer) }
    before do
      sign_in producer
      visit producer_path(producer)
    end
    it { should have_content(producer.user_name) } 
    it { should have_title(full_title(producer.user_name)) }
  end
end