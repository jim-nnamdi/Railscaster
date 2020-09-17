class EntriesController < ApplicationController

    # Handling the Cross sitr request Forgery.
    skip_before_action :verify_authenticity_token

    # return all entries
    def index 
        @entry = Entry.all.order("created_at desc")

        # show the entry at Jumbotron section 
        @jumbo_entry = Entry.first
        @m_jumbo_entry = Entry.order("created_at").last
    end

    # create a new entry 
    def new 
        @entry = Entry.new 
    end

    # show a single entry 
    def show 
        @entry = Entry.find(params[:id])

        @related = Entry.order("created_at DESC").first
        @other_related = Entry.order("created_at ASC").first
    end

    # save an entry to database 
    def create 
        
        @entry = Entry.new(entries_parameters)
        if @entry.save 
            flash[:notice] = "Entry saved successfully"

            # can use redirect_to root_url
            redirect_to :action => 'index'
        else
            flash.now[:error] = "Entry not saved"
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
            if(@entry.save!)
                flash.now[:error] = "Error in updating entry"
            else
            redirect_to :action => 'show', :id => @entry
            end
        else 
            render :action => 'edit'
        end
    end

    # function to delete an entry 
    def destroy 
        Entry.find(params[:id]).destroy 
        redirect_to :action => 'index'
    end

   # custom function that holds parameters to
   # be passed when making an entry.

   def entries_parameters 
    params.require(:entry).permit(:title,:description, :author, :entryimage)
   end

end
