const OpenAI = require('openai')
const dotenv = require('dotenv');

dotenv.config(); // Load environment variables from .env file

const openai = new OpenAI({
    apiKey: process.env.OPENAI_API_KEY, // Set up OpenAI client with API key from environment variables
});

// Generate content based on a given topic
const topicContentGeneration = async (req, res, next) => {
    const topic_name = req.body.topic;
    let response;
    try {
        // Generate content using OpenAI's completion API
        response = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: [
                {
                    "role": "user",
                    "content": `provide content for the given topic ${topic_name} with examples`
                }
            ],
            temperature: 0.5,
            max_tokens: 4096,
            top_p: 1,
        });
    } catch (error) {
        console.error('Error generating content for the topic:', error);
    }
    let content = response.choices[0].message.content

    return res.status(200).json({ 'response': content })
}

// Generate multiple choice questions based on provided content
const mcqGenerations = async (req, res, next) => {
    const content = req.body.content;
    let response;

    try {
        // Generate multiple choice questions using OpenAI's completion API
        response = await openai.chat.completions.create({
            model: "gpt-3.5-turbo",
            messages: [
                {
                    "role": "system",
                    "content": "You will be provided with content, your task is to provide multiple choice questions along with the answer"
                },
                {
                    "role": "user",
                    "content": `generate 5 multiple choice questions and answer for the respective for the given content ${content}. Provide the response in JSON format and it must contain question, option1, option2, option3, option4 and correct_answer only, don't generate the question in any format`
                }
            ],
            temperature: 0.0,
            max_tokens: 1024,
            top_p: 1.0,
        });

        // Check if response.choices is undefined or empty
        if (!response.choices || response.choices.length === 0) {
            throw new Error('Invalid response: response.choices is undefined or empty');
        }

        // Extract the JSON object from the response content
        const jsonString = response.choices[0].message.content.trim();
        const jsonStartIndex = jsonString.indexOf('{');
        const jsonResponseString = jsonString.substring(jsonStartIndex);

        // Parse the JSON response
        const jsonResponse = JSON.parse(jsonResponseString);

        // Create the response object with questions and answer options
        const formattedResponse = {
            questions: jsonResponse.questions,
        };

        return res.status(200).json(formattedResponse);
    } catch (error) {
        console.error('Error generating questions for the given topic:', error);
        return res.status(500).json({ error: 'Error generating questions for the given topic' });
    }
}

// Provide recommended topics based on the user's test result
const resultAnalysis = async (req, res, next) => {
    const topic = req.body.topic;
    const result = req.body.result;
    const result_score = req.body.result + "/5";
    if (result < 3) {
        return res.status(200).json({ 'response': "Please explore this topic once more and retake the test" })
    } else {
        let response;
        try {
            // Generate recommended topics based on user's test result using OpenAI's completion API
            response = await openai.chat.completions.create({
                model: "gpt-3.5-turbo",
                messages: [
                    {
                        "role": "user",
                        "content": `based on result value ${result_score} provide recommended topics to learn for the following topic ${topic}`
                    }
                ],
                temperature: 0.5,
                max_tokens: 4096,
                top_p: 1,
            });
        } catch (error) {
            console.error('Error generating content for the topic:', error);
        }
        let content = response.choices[0].message.content

        return res.status(200).json({ 'response': content })
    }
}

// Export the functions for use in other modules
exports.topicContentGeneration = topicContentGeneration;
exports.mcqGenerations = mcqGenerations;
exports.resultAnalysis = resultAnalysis;
