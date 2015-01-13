def handle_go(exception)
  p "Process command: Go and message is #{exception.message}"
end

def handle_jump(exception)
  p "Process command: Jump and message is #{exception.message}"
end

def handle_sneak(exception)
  p "Process command: Sneak and message is #{exception.message}"
end

def handle_run(exception)
  p "Process command: Run and message is #{exception.message}"
end

def handle_stand(exception)
  p "Process command: Stand and message is #{exception.message}"
end

def handle_unknown(exception)
  p "Idle and message is #{exception.message}"
end

class GoException < Exception;
end
class JumpException < Exception;
end
class SneakException < Exception;
end
class RunException < Exception;
end
class StandException < Exception;
end
class UnknownException < Exception;
end


def handle(exception)
  begin
    raise exception
  rescue GoException
    handle_go(exception)
  rescue JumpException
    handle_jump(exception)
  rescue SneakException
    handle_sneak(exception)
  rescue RunException
    handle_run(exception)
  rescue StandException
    handle_stand(exception)
  rescue UnknownException
    handle_unknown(exception)
  ensure
    puts "Command processed"
  end
end


def process(*args)

  args.each do |command|
    begin
      raise Object.const_get("#{command}Exception").new(command)
    rescue NameError
      handle(UnknownException.new(command))
    rescue Exception => e
      handle(e)
    end
  end

end

process "Run", "Stand", "Fight"