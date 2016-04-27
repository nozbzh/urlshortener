require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #index" do
    it "assigns a new Url instance to @url" do
      get :index
      expect(assigns(:url)).to be_a_new(Url)
    end

    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      @url = create(:url, original_url: "google.com")
      @url.sanitize
      @url.save
    end
    it "assigns the requested url to @url" do
      get :show, params: { short_url: @url.short_url }
      expect(assigns(:url)).to eq @url
    end
    it "redirects to the sanitized url" do
      get :show, params: { short_url: @url.short_url }
      expect(response).to redirect_to(@url.sanitized_url)
    end
    it "has a 302 status code" do
      get :show, params: { short_url: @url.short_url }
      expect(response.status).to eq(302)
    end
  end

  describe "GET #shortened" do
    before :each do
      @url = create(:url, original_url: "google.com")
      @url.sanitize
      @url.save
    end
    it "assigns the requested url to @url" do
      get :shortened, params: { short_url: @url.short_url }
      expect(assigns(:url)).to eq(@url)
    end

    it "has a 200 status code" do
      get :shortened, params: { short_url: @url.short_url }
      expect(response.status).to eq(200)
    end

    it "renders the shortened template" do
      get :shortened, params: { short_url: @url.short_url }
      expect(response).to render_template :shortened
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      context "with a new url" do
        it "creates a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url) }
          }.to change(Url, :count).by(1)
        end
        it "redirects to the url edit page" do
          post :create, params: { url: attributes_for(:url) }
          expect(response).to redirect_to shortened_path(assigns[:url].short_url)
        end
      end
      context "with a url that is already in the database" do
        before :each do
          @url = create(:url, original_url: 'google.com')
          @url.sanitize
          @url.save
        end
        it "does not create a new url entry" do
          expect{
            post :create, params: { url: attributes_for(:url, original_url: 'www.google.com') }
          }.to_not change(Url, :count)
        end
        it "redirects to the existing url edit page" do
          post :create, params: { url: attributes_for(:url, original_url: 'www.google.com') }
          expect(response).to redirect_to shortened_path(@url.short_url)
        end
      end
    end
    context "with invalid attributes" do
      it "does not create a new url entry" do
        expect{
          post :create, params: { url: attributes_for(:url, original_url: nil) }
        }.to_not change(Url, :count)
      end
      it "renders the :index template" do
        post :create, params: { url: attributes_for(:url, original_url: nil) }
        expect(response).to render_template :index
      end
    end
  end
end
