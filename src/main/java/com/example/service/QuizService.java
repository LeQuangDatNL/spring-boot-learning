package com.example.service;

import org.springframework.stereotype.Service;

import dev.langchain4j.data.message.AiMessage;
import dev.langchain4j.data.message.UserMessage;
import dev.langchain4j.model.chat.ChatLanguageModel;
import dev.langchain4j.model.output.Response;

@Service
public class QuizService {
    private final ChatLanguageModel chatModel;

    public QuizService(ChatLanguageModel chatModel) {
        this.chatModel = chatModel;
    }

    public String askAIWithText(String prompt) {
        try {
            String instruction = "Bạn là trợ lý học tập. Hãy giải thích câu hỏi trắc nghiệm sau, chỉ ra đáp án đúng và lý do tại sao các đáp án khác sai. Trình bày ngắn gọn cách dòng dễ hiểu tôi đang hiển thị dữ liệu ra note"
            		+ "Nếu câu trả lời rõ ràng có đáp án thì ghi kiểu"
            		+ "Đáp án là x"
            		+ "Vì xxxxxxxx"
            		+ "Đáp án x sai vì"
            		+ "..."
            		+ "Dùng * cho các phần kết luận mở đầu"
            		+ "Dùng - + cho các ý :\n\n";
            Response<AiMessage> response = chatModel.generate(UserMessage.from(instruction + prompt));
            return response.content().text();
        } catch (Exception e) {
            return "Lỗi AI: " + e.getMessage();
        }
    }

}