package com.tamilnadu.culture.controller;

import com.tamilnadu.culture.dto.ApiResponse;
import com.tamilnadu.culture.dto.ChatRequest;
import com.tamilnadu.culture.dto.ChatResponse;
import com.tamilnadu.culture.service.ChatbotService;
import jakarta.validation.Valid;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chatbot")
public class ChatbotController {

    private final ChatbotService chatbotService;

    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @PostMapping("/message")
    public ResponseEntity<ApiResponse<ChatResponse>> chat(@Valid @RequestBody ChatRequest request) {
        ChatResponse response = chatbotService.processChat(request);
        return ResponseEntity.ok(ApiResponse.ok(response));
    }
}
