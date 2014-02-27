SurveyGorilla::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :surveys, except: [:new, :edit] do
        resources :questions, shallow: true, except: [:new, :edit]
      end
      resources :answers, except: [:new, :edit]
    end
  end

  get '*foo', :to => 'landing#index'

end
