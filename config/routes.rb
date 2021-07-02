# frozen_string_literal: true

Rails.application.routes.draw do
  resources :items do
    get :upvote, on: :member
    get :expensive, on: :collection
  end
end
