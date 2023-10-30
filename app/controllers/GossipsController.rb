class GossipsController < ApplicationController
    def index
        @gossips = Gossip.all
    end
    def show
        @gossip = Gossip.find_by(id: params[:id])
    end
    def new
        @gossip = Gossip.new
    end
    def create
        @gossip = Gossip.new(gossip_params)
        @gossip.user = User.find(1)
        if @gossip.save
        redirect_to @gossip
        else
        render 'new'
        end
    end
    def edit
        @gossip = Gossip.find(params[:id])
    end
    def update
        @gossip = Gossip.find(params[:id])
        if @gossip.update(gossip_params)
        redirect_to @gossip
        else
        render 'edit'
        end
    end
    def destroy
        @gossip = Gossip.find(params[:id])
        @gossip.destroy
        redirect_to gossips_path
    end
    private
    def gossip_params
        params.require(:gossip).permit(:title, :content)
    end
    end