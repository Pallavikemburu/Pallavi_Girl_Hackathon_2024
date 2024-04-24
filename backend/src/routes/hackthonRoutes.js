const express = require('express');
const Router = express.Router();

const HackathonController = require('../controllers/hackathonController');

Router.post('/api/topic-content-generation', HackathonController.topicContentGeneration);
Router.post('/api/generate-mcq', HackathonController.mcqGenerations);
Router.post('/api/result-analysis', HackathonController.resultAnalysis);

module.exports = Router;
