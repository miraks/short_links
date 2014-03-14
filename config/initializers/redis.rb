db = ENV.fetch 'REDIS_DB', 0
Redis.current = Redis.new db: db
