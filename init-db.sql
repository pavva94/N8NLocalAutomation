-- Create the news tables for the automation
CREATE TABLE IF NOT EXISTS daily_news (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    summary TEXT,
    content TEXT,
    url TEXT,
    source TEXT,
    published_at TIMESTAMP,
    image_url TEXT,
    interest_category TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS daily_podcasts (
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    script TEXT,
    file_path TEXT,
    article_count INTEGER,
    categories TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_daily_news_created_at ON daily_news(created_at);
CREATE INDEX IF NOT EXISTS idx_daily_news_category ON daily_news(interest_category);
CREATE INDEX IF NOT EXISTS idx_daily_podcasts_date ON daily_podcasts(date);

-- Insert sample user interests (you can modify this)
CREATE TABLE IF NOT EXISTS user_interests (
    id SERIAL PRIMARY KEY,
    interest TEXT NOT NULL,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO user_interests (interest) VALUES
    ('Technology'),
    ('Artificial Intelligence'),
    ('Climate Change'),
    ('Space Exploration'),
    ('Renewable Energy'),
    ('Cybersecurity'),
    ('Blockchain'),
    ('Healthcare Innovation')
ON CONFLICT DO NOTHING;


