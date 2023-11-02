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
        @gossip.user = current_user
        if @gossip.save
        redirect_to @gossip
        else
        render 'show'
        end
    end
    def edit
        @gossip = Gossip.find(params[:id])
        if @gossip.user != current_user
            redirect_to @gossip, alert: "You can only edit your own gossips."
        end
    end

    def update
        @gossip = Gossip.find(params[:id])
        if @gossip.user != current_user
            redirect_to @gossip, alert: "You can only update your own gossips."
        else
            if @gossip.update(gossip_params)
                redirect_to @gossip
            else
                render 'edit'
            end
        end
    end

    def destroy
        @gossip = Gossip.find(params[:id])
        if @gossip.user != current_user
            redirect_to @gossip, alert: "You can only delete your own gossips."
        else
            @gossip.destroy
            redirect_to gossips_path
        end
    end
    private
    def gossip_params
        params.require(:gossip).permit(:title, :content)
    end
    end