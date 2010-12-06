class CitizensController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead  

  # render new.rhtml
  def new
    @citizen = Citizen.new
  end
 
  def create
    logout_keeping_session!
    @citizen = Citizen.new(params[:citizen])
    success = @citizen && @citizen.save
    if success && @citizen.errors.empty?
      # Protects against session fixation attacks, causes request forgery
      # protection if visitor resubmits an earlier form using back
      # button. Uncomment if you understand the tradeoffs.
      # reset session
      self.current_citizen = @citizen # !! now logged in
      redirect_back_or_default('/settings')
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
  end
  
  def update
    @citizen = current_citizen
    @citizen.country = Country.find(params[:citizen][:country_id])
    @citizen.street = params[:citizen][:street]
    @citizen.street_2 = params[:citizen][:street_2]
    @citizen.postal = params[:citizen][:postal]
    @citizen.email = params[:citizen][:email]
    @citizen.bio = params[:citizen][:bio]
    if params[:region_named] && !@citizen.country.regions.collect{|region| region.name}.join(" ").include?(params[:region_named])
      @region = Region.new
      @region.name = params[:region_named]
      @region.country = Country.find(params[:citizen][:country_id])
      @region.save
      @citizen.region = @region
    elsif params[:region]
      if params[:region].to_i == 0
        @citizen.region = nil
      else
        @citizen.region = Region.find(params[:region])
      end
    end
    if params[:county_named] && @citizen.region && !@citizen.region.counties.collect{|county| county.name}.join(" ").include?(params[:county_named])
      @county = County.new
      @county.name = params[:county_named]
      @county.region = @citizen.region
      @county.save
      @citizen.county = @county
    elsif params[:county]
      if params[:county].to_i == 0
        @citizen.county = nil 
      else
        @citizen.county = County.find(params[:county])
      end
    end
    if !params[:citizen][:password].empty? && params[:citizen][:password] == params[:citizen][:password_confirmation]
      @citizen.password = params[:citizen][:password]
      @citizen.password = params[:citizen][:password_confirmation]
    end
    if @citizen.save
      redirect_back_or_default('/')
    else
      flash[:error]  = @citizen.errors
      render :action => 'settings'
    end
  end
  
  def home
    if logged_in?
      @citizen = current_citizen
    else
      redirect_back_or_default('/login')
    end
  end
  
  def settings
    @citizen = self.current_citizen || nil
    redirect_back_or_default('/login') if @citizen.nil?
  end
  
  def region_select
    @country = Country.find(params[:id])
    render :update do |page|
      page.replace_html "citizen-main-constituencies-region", :partial => "/regions/region_select"
    end
  end
  
  def county_select
    @region = Region.find(params[:id].gsub(/[\\|\"]/, "").to_i)
    render :update do |page|
      page.replace_html "citizen-main-constituencies-county", :partial => "/counties/county_select"
    end
  end
  
end
