require "bundler/gem_tasks"
task :default => :spec

desc "Clone the repo's submodules"
task :submodule do
  system("git submodule init")
  system("git submodule update")
end

task build: :submodule
