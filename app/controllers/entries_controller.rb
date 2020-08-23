class EntriesController < ApplicationController

    # return all entries
    def index 
        @entries = entry.all 
    end

    # create a new entry 
    def new 
        @entry = entry.new 
    end

    # show a single entry 
    def show 
        @entry = entry.find(params[:id])
    end

    # save an entry to database 
    def create 
        @entry = entry.new(entries_parameters)
        if @entry.save 
            redirect_to :action => 'new'
        else
            render :action => 'index'
        end
    end
end
