// app.test.js
const request = require('supertest');
const app = require('./app');

describe('Simple CI/CD App', () => {
  test('GET / should return welcome message', async () => {
    const response = await request(app)
      .get('/')
      .expect(200);
    
    expect(response.body).toHaveProperty('message');
    expect(response.body.message).toBe('Hello from CI/CD Pipeline!');
    expect(response.body).toHaveProperty('version');
    expect(response.body).toHaveProperty('timestamp');
  });

  test('GET /health should return health status', async () => {
    const response = await request(app)
      .get('/health')
      .expect(200);
    
    expect(response.body).toHaveProperty('status');
    expect(response.body.status).toBe('healthy');
    expect(response.body).toHaveProperty('uptime');
    expect(response.body).toHaveProperty('timestamp');
  });

  test('GET /nonexistent should return 404', async () => {
    await request(app)
      .get('/nonexistent')
      .expect(404);
  });
});