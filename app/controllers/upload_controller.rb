class UploadController < ApplicationController  
  def index  
   @dengluzhanghu = Dengluzhanghu.new
     #render :file => 'app/views/upload/uploadfile.html.erb'  
  end  
  def upload  
   path = 'public/data1'
   File.open(path, "wb") { |f| f.write(params[:image].read) }
  end  
end  
