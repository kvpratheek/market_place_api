Rails.application.routes.draw do

  namespace(:api, defaults: { format: :json }) do
    namespace(:v1) do
      resources(:users, only: [:show, :create, :update]) ## You can also write the array as %i[show create]  without comma
      ## or %I[show create] which also supports interpolation with out comma
    end
  end
end
