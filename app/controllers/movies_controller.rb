class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    ratings_form = params[:ratings] || {}
    # debugger
    @ratings_to_show = ratings_form.keys
    #definimos las clases de controlador que nos permitiran colorear dependiendo donde hagamos click
    @sort_column_class_title = nil
    @sort_column_class_date = nil

    #Ordenamos las peliculas
    case params[:sort]
    when 'name'
      @movies = Movie.with_ratings(@ratings_to_show).order(:title)
      @sort_column_class_title = 'hilite p-3 mb-2 bg-warning text-dark' if params[:sort] == 'name'
    when 'date'
      @movies = Movie.with_ratings(@ratings_to_show).order(:release_date)
      @sort_column_class_date = 'hilite p-3 mb-2 bg-warning text-dark' if params[:sort] == 'date'
    else
      @movies = Movie.with_ratings(@ratings_to_show)
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
