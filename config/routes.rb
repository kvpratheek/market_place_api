Rails.application.routes.draw do


  namespace(:api, defaults: { format: :json }) do
    namespace(:v1) do
      resources(:users, only: [ :show, :create, :update , :destroy])
      resources(:tokens, only: %i[ create ])
      resources(:products, only: %i[ index show create update destroy ])
    end
  end
end
