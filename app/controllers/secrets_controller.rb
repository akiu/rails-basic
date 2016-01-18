class SecretsController < ApplicationController
    before_filter :authorize, only: [:index, :new, :create, :edit, :update]

    def index
        @secrets = Secret.all
    end

    def new
        @secrets = Secret.new
    end

    def create
        @secrets = Secret.new(secret_params)
        if @secrets.save
            redirect_to secrets_path #, notice: "Thank you for signing up"
        else
            render "new"
        end  
    end

    def show
        @secret = Secret.find(params[:id])
    end

    def edit
        @secret = Secret.find(params[:id])
    end

    def update
        secret = Secret.find(params[:id])
        #render :text => secret_params[:title]
        
        if secret
            secret.title = secret_params[:title]
            secret.content = secret_params[:content]
            secret.save
            redirect_to secrets_path, notice: "Secret Updated"
        else
            redirect_to secrets_path, notice: "Secret Not Found"
        end

    end

    def destroy
        secret = Secret.find(params[:id])
        if secret
            secret.destroy
            redirect_to secrets_path, notice: "Secret Deleted"
        else
            redirect_to secrets_path, notice: "Secret Not Found"
        end
    end

    private

    def secret_params
        params.require(:secret).permit(:title, :content)
    end
end
