# frozen_string_literal: true

module Formatter
  module Music
    def osx?
      platform.downcase.include?('darwin')
    end

    def linux?
      platform.downcase.include?('linux')
    end

    def kernel=(kernel)
      @kernel = kernel
    end

    def kernel
      @kernel ||= Kernel
    end

    def platform=(platform)
      @platform = platform
    end

    def platform
      @platform ||= RUBY_PLATFORM
    end

    def start(input)
      super
      @music_thread = Thread.new { start_music_or_kill(Thread.current) }
      wait_for_music_to_start(@music_thread)
    end

    def dump_summary(*args)
      kill_music
      super
    end

    private

    def kill_music
      if @music_thread && @music_thread['music_pid']
        @music_thread.kill
        Process.kill('KILL', @music_thread['music_pid'])
      end
    end

    def linux_player
      %w[mpg321 mpg123].find do |player|
        kernel.system("which #{player} >/dev/null 2>&1 && type #{player} >/dev/null 2>&1")
      end
    end

    def music_command
      # this isn't really threadsafe but it'll work if we're careful
      return @music_command if @music_command

      if osx?
        @music_command = "afplay #{rainbow_mp3}"
      elsif linux? && linux_player
        @music_command = "#{linux_player} #{rainbow_mp3} >/dev/null 2>&1"
      end
    end

    def start_music_or_kill(thread)
      thread.exit unless File.exist?(rainbow_mp3) && music_command
      loop do
        thread['music_pid'] = kernel.spawn(music_command)
        thread['started_playing'] ||= true
        Process.wait(thread['music_pid'])
      end
    end

    def wait_for_music_to_start(music_thread)
      sleep 0.001 while !music_thread['started_playing'] && music_thread.status
    end
  end
end
