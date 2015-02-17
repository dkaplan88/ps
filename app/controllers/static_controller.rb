class StaticController < ApplicationController
  def home
  end

  def resume
    send_file(
      "#{Rails.root}/public/resume.pdf",
      filename: "Dan_Kaplan_Resume.pdf",
      type: "application/pdf"
    )
  end
end
