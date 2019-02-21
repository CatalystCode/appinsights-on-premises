CREATE TABLE IF NOT EXISTS clients (
  client UUID NOT NULL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS events (
  client UUID REFERENCES clients,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  name TEXT NOT NULL,
  properties JSONB NOT NULL,
  _original JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS logs (
  client UUID REFERENCES clients,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  message TEXT NOT NULL,
  severity SMALLINT NOT NULL,
  _original JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS exceptions (
  client UUID REFERENCES clients,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  exceptions JSONB NOT NULL,
  _original JSONB NOT NULL
);

CREATE TABLE IF NOT EXISTS requests (
  client UUID REFERENCES clients,
  created_at TIMESTAMP WITH TIME ZONE NOT NULL,
  name TEXT NOT NULL,
  url TEXT NOT NULL,
  status_code SMALLINT,
  success BOOLEAN,
  duration INTERVAL,
  _original JSONB NOT NULL
);
