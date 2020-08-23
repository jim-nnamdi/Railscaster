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
            redirect_to :action => 'index'
        else
            render :action => 'new'
        end
    end

    # edit an entry 
    def edit 
        @entry = entry.find(params[:id])
    end

    # update an entry 
    def update 
        @entry = entry.find(params[:id])
        if @entry.update_attributes(entries_parameters)
            redirect_to :action => 'show', :id => @entry
        else 
            render :action => 'edit'
        end
    end

   # custom function that holds parameters to
   # be passed when making an entry.

   def entries_parameters 
    params.require(:entry).permit(:title, :description, :author)
   end

end
