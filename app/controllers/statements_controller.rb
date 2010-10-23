class StatementsController < ApplicationController
  # GET /statements
  # GET /statements.xml
  def index
    @statements = Statement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @statements }
    end
  end

  # GET /statements/1
  # GET /statements/1.xml
  def show
    @statement = Statement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @statement }
    end
  end

  # GET /statements/new
  # GET /statements/new.xml
  def new
    @statement = Statement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @statement }
    end
  end

  # GET /statements/1/edit
  def edit
    @statement = Statement.find(params[:id])
  end

  # POST /statements
  # POST /statements.xml
  def create
    @statement = Statement.new(params[:statement])

    respond_to do |format|
      if @statement.save
        flash[:notice] = 'Statement was successfully created.'
        format.html { redirect_to(@statement) }
        format.xml  { render :xml => @statement, :status => :created, :location => @statement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @statement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /statements/1
  # PUT /statements/1.xml
  def update
    @statement = Statement.find(params[:id])

    respond_to do |format|
      if @statement.update_attributes(params[:statement])
        flash[:notice] = 'Statement was successfully updated.'
        format.html { redirect_to(@statement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @statement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /statements/1
  # DELETE /statements/1.xml
  def destroy
    @statement = Statement.find(params[:id])
    @statement.destroy

    respond_to do |format|
      format.html { redirect_to(statements_url) }
      format.xml  { head :ok }
    end
  end
end
