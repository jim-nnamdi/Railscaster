class EntriesController < ApplicationController
    skip_before_action :verify_authenticity_token

    # return all entries
    def index 
        @entry = Entry.all 
    end

    # create a new entry 
    def new 
        @entry = Entry.new 
    end

    # show a single entry 
    def show 
        @entry = Entry.find(params[:id])
    end

    # save an entry to database 
    def create 
        
        @entry = Entry.new(entries_parameters)
        if @entry.save 
            flash[:notice] = "Entry saved successfully"

            # can use redirect_to root_url
            redirect_to :action => 'index'
        else
            flash.new(:error) = "Entry not saved"
            render :action => 'new'
        end
    end

    # edit an entry 
    def edit 
        @entry = Entry.find(params[:id])
    end

    # update an entry 
    def update 
        @entry = Entry.find(params[:id])
        if @entry.update_attributes(entries_parameters)
            redirect_to :action => 'show', :id => @entry
        else 
            render :action => 'edit'
        end
    end

    # function to delete an entry 
    def delete 
        Entry.find(params[:id]).destroy 
        redirect_to :action => 'index'
    end

   # custom function that holds parameters to
   # be passed when making an entry.

   def entries_parameters 
    params.require(:entry).permit(:title,:description, :author)
   end

end
