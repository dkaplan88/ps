class StaticController < ApplicationController
  def home
    render layout: 'home'
  end

  def about
  end

  def where_am_i
  end

  def resume
    send_file(
      "#{Rails.root}/public/resume.pdf",
      filename: "Dan_Kaplan_Resume.pdf",
      type: "application/pdf"
    )
  end

  def countries
  end
end
