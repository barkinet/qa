require 'spec_helper'

describe 'routing for questions' do
  it 'routes / to questions#index' do
    { get: '/' }.should route_to(controller: 'questions', action: 'index' )
    { get: '/questions' }.should_not be_routable
  end

  it 'routes /ask to questions#new' do
    { get: '/ask' }.should route_to(controller: 'questions', action: 'new')
  end

  it 'routes post /questions to questions#create' do
    { post: '/questions' }.should route_to(controller: 'questions', action: 'create')
  end

  it 'routes get /q/:id/edit to questions#edit' do
    { get: '/q/1/edit' }.should route_to(controller: 'questions', action: 'edit', id: '1')
  end
end