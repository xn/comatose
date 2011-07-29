namespace :comatose do
  #
  # Setup Task...
  #
  namespace :setup do
    
    desc "If the installation didn't add the images correctly, use this task"
    task :copy_images do
      sources         = File.join(Comatose.gem_root, 'public/images/comatose', '*.gif')
      destination_dir = File.join(Rails.root.to_s, 'public/images/comatose')
      Comatose.logger.debug "[**Comatose**]: sources: #{sources}"
      puts "[**Comatose**]: sources: #{sources}"
      Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      puts "[**Comatose**]: destination dir: #{destination_dir}"
      unless FileTest.exist? destination_dir
        FileUtils.mkdir destination_dir
      end
      FileUtils.cp(Dir.glob(sources), destination_dir, :verbose => true)
      puts "Finished."
    end


    desc "If the installation didn't add the stylesheets correctly, use this task"
    task :copy_stylesheets do
      sources         = File.join(Comatose.gem_root, 'public/stylesheets/comatose', '*.css')
      destination_dir = File.join(Rails.root.to_s, 'public/stylesheets/comatose')
      Comatose.logger.debug "[**Comatose**]: sources: #{sources}"
      puts "[**Comatose**]: sources: #{sources}"
      Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      puts "[**Comatose**]: destination dir: #{destination_dir}"
      unless FileTest.exist? destination_dir
        FileUtils.mkdir destination_dir
      end
      FileUtils.cp(Dir.glob(sources), destination_dir, :verbose => true)
      puts "Finished."
    end


    desc "If the installation didn't add the javascripts correctly, use this task"
    task :copy_javascripts do
      sources         = File.join(Comatose.gem_root, 'public/javascripts/comatose', '*.js')
      destination_dir = File.join(Rails.root.to_s, 'public/javascripts/comatose')
      Comatose.logger.debug "[**Comatose**]: sources: #{sources}"
      puts "[**Comatose**]: sources: #{sources}"
      Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      puts "[**Comatose**]: destination dir: #{destination_dir}"
      unless FileTest.exist? destination_dir
        FileUtils.mkdir destination_dir
      end
      FileUtils.cp(Dir.glob(sources), destination_dir, :verbose => true)

      sources         = File.join(Comatose.gem_root, 'public/javascripts/jquery', '*')
      destination_dir = File.join(Rails.root.to_s, 'public/javascripts/jquery')
      Comatose.logger.debug "[**Comatose**]: sources: #{sources}"
      puts "[**Comatose**]: sources: #{sources}"
      Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      puts "[**Comatose**]: destination dir: #{destination_dir}"
      unless FileTest.exist? destination_dir
        FileUtils.mkdir destination_dir
      end
      FileUtils.cp(Dir.glob(sources), destination_dir, :verbose => true)

      #source_tar        = File.join(Comatose.gem_root, 'public/javascripts/wymeditor.tar')
      #destination_dir   = File.join(Rails.root.to_s, 'public/javascripts')
      #Comatose.logger.debug "[**Comatose**]: source: #{source_tar}"
      #puts "[**Comatose**]: source: #{source_tar}"
      #Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      #puts "[**Comatose**]: destination dir: #{destination_dir}"
      #unless FileTest.exist? destination_dir
      #  FileUtils.mkdir destination_dir
      #end
      #FileUtils.cp(source_tar, destination_dir, :verbose => true)
      #`tar xvf #{File.join(destination_dir, "wymeditor.tar")}`

      sources         = File.join(Comatose.gem_root, 'public/javascripts', '*.js')
      destination_dir = File.join(Rails.root.to_s, 'public/javascripts')
      Comatose.logger.debug "[**Comatose**]: sources: #{sources}"
      puts "[**Comatose**]: sources: #{sources}"
      Comatose.logger.debug "[**Comatose**]: destination dir: #{destination_dir}"
      puts "[**Comatose**]: destination dir: #{destination_dir}"
      unless FileTest.exist? destination_dir
        FileUtils.mkdir destination_dir
      end
      FileUtils.cp(Dir.glob(sources), destination_dir, :verbose => true)


      puts "Finished."
    end
    
    # For use when upgrading...
    
    def move(args)
      if ENV['USE_SVN'] == 'true'
        `svn move #{args}`
      else
        `mv #{args}`
      end
    end
    
    def delete(args)
      if ENV['USE_SVN'] == 'true'
        `svn delete #{args}`
      else
        `rm -rf #{args}`
      end
    end
    
    # TODO: Test the setup:restructure_customization task...
    desc "[EXPERIMENTAL] Restructures customized admin folder to version 0.6 from older version -- Only run this if you have customized the admin. USE_SVN=true if you want to update subversion"
    task :restructure_customization do
      ENV['USE_SVN'] ||= 'false'
      move 'public/javscripts/comatose.js public/javscripts/admin.js'
      move 'public/stylesheets/comatose.css public/stylesheets/admin.css'
      move 'app/views/comatose app/views/comatose_admin' 
      delete 'app/views/layouts/base.html.erb'
    end
  end
end