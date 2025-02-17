class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.find_by(name: params["landmark"]["name"])

    if landmark
      redirect :"/landmarks/:id/edit"
    else
      new_landmark = Landmark.create(params["landmark"])
      redirect :"/landmarks/:id"
    end
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])
    landmark.update(params['landmark'])

    redirect :"/landmarks/#{landmark.id}"
  end
end
