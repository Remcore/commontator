module ActionDispatch::Routing
  class Mapper
    def commentable
      namespace :commontator do
        resources :threads, :only => [:show], :shallow => true do
          resources :comments, :except => [:index], :shallow => true
          put 'close', :on => :member
          put 'reopen', :on => :member
          post 'subscribe', :to => 'subscriptions#create',
                            :as => 'subscribe',
                            :on => :member
          post 'unsubscribe', :to => 'subscriptions#destroy',
                              :as => 'unsubscribe',
                              :on => :member
        end
      end
    end

    def commontable
      commentable
    end
  end
end