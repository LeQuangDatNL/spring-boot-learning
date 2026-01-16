<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../components/head-libs.jsp" />
<style>
    .question-card { border-radius: 15px; border: 1px solid #dee2e6; transition: all 0.3s; }
    .answer-option { cursor: pointer; border: 1px solid #e9ecef; border-radius: 10px; padding: 12px 15px; margin-bottom: 10px; transition: 0.2s; }
    .answer-option:hover { background-color: #f8f9fa; border-color: #0d6efd; }
    .option-correct { background-color: #d1e7dd !important; border-color: #a3cfbb !important; color: #0a3622; font-weight: bold; }
    .option-wrong { background-color: #f8d7da !important; border-color: #f1aeb5 !important; color: #58151c; }
    .audio-player { width: 100%; border-radius: 30px; background: #f1f3f4; padding: 10px; }
    .note-area { border-left: 4px solid #ffc107; background: #fffcf0; }
</style>
</head>
<body class="bg-light">
    <jsp:include page="../../components/header.jsp" />

    <div class="container my-5">
        <div class="row">
            <div class="col-lg-5">
                <div class="card shadow-sm sticky-top" style="top: 80px;">
                    <div class="card-header bg-dark text-white">
                        <h5 class="mb-0">Nội dung đề bài</h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty moDe.nguonFile}">
                            <div class="mb-4">
                                <label class="fw-bold mb-2"><i class="fas fa-headphones"></i> Nghe Audio:</label>
                                <audio controls class="audio-player">
                                    <source src="${pageContext.request.contextPath}/mp3/${moDe.nguonFile}" type="audio/mpeg">
                                </audio>
                            </div>
                        </c:if>
                        <div class="content-text p-3 border rounded bg-white" style="max-height: 500px; overflow-y: auto;">
                            ${moDe.noiDungText}
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <h4 class="mb-4 fw-bold text-primary">Phần luyện tập: ${moDe.maMoDe}</h4>

                <c:forEach var="ch" items="${dsCauHoi}" varStatus="status">
                    <div class="card question-card shadow-sm mb-4" id="q-container-${ch.maCauHoi}">
                        <div class="card-body p-4">
                            <h6 class="fw-bold mb-3" id="text-q-${ch.maCauHoi}">Câu ${ch.thuTu}: ${ch.noiDung}</h6>

                            <div class="options-group" data-correct="${ch.dapAnDung}" data-id="${ch.maCauHoi}">
                                <div class="answer-option d-flex align-items-center" onclick="checkAnswer(this, 'A')">
                                    <span class="fw-bold me-3">A.</span> <span class="option-text option-text-${ch.maCauHoi}">${ch.dapAnA}</span>
                                </div>
                                <div class="answer-option d-flex align-items-center" onclick="checkAnswer(this, 'B')">
                                    <span class="fw-bold me-3">B.</span> <span class="option-text option-text-${ch.maCauHoi}">${ch.dapAnB}</span>
                                </div>
                                <div class="answer-option d-flex align-items-center" onclick="checkAnswer(this, 'C')">
                                    <span class="fw-bold me-3">C.</span> <span class="option-text option-text-${ch.maCauHoi}">${ch.dapAnC}</span>
                                </div>
                                <div class="answer-option d-flex align-items-center" onclick="checkAnswer(this, 'D')">
                                    <span class="fw-bold me-3">D.</span> <span class="option-text option-text-${ch.maCauHoi}">${ch.dapAnD}</span>
                                </div>
                            </div>

                            <div class="mt-3">
                                <button class="btn btn-sm btn-outline-info d-flex align-items-center gap-2" 
                                        type="button" data-bs-toggle="collapse" 
                                        data-bs-target="#collapseInfo-${ch.maCauHoi}">
                                    <i class="fas fa-lightbulb"></i> <span>Xem giải thích & Ghi chú</span>
                                </button>	
                            </div>
                            
                            <div class="collapse" id="collapseInfo-${ch.maCauHoi}">
                                <div class="card card-body mt-2 p-3 border-start border-4 border-info bg-light shadow-sm">
                                    <strong class="text-info small text-uppercase"><i class="fas fa-info-circle me-1"></i>Giải thích:</strong>
                                    <p class="mb-0 mt-1 text-dark small">
                                        ${not empty ch.giaiThich ? ch.giaiThich : 'Chưa có lời giải chi tiết.'}
                                    </p>
                                </div>

								<div class="card card-body mt-2 p-3 note-area shadow-sm" style="border-left: 4px solid #ffc107; background-color: #fffcf0;">
								    <strong class="text-warning small text-uppercase">
								        <i class="fas fa-sticky-note me-1"></i> Ghi chú của bạn:
								    </strong>
								    
									<textarea id="note-${ch.maCauHoi}" class="form-control form-control-sm mt-2" rows="12" style="border-radius: 8px; border: 1px solid #ffeeba;" placeholder="Nhập ghi chú cá nhân tại đây..."><c:forEach var="gc" items="${dsGhiChu}"><c:if test="${gc.maCauHoi == ch.maCauHoi}">${gc.ghiChu.trim()}</c:if></c:forEach></textarea>
								              
								    <div class="d-flex justify-content-end mt-2">
								        <button id="btn-save-${ch.maCauHoi}" 
								                class="btn btn-primary btn-sm px-3 shadow-sm" 
								                onclick="saveNote('${ch.maCauHoi}')">
								            <i class="fas fa-save me-1"></i> Lưu ghi chú
								        </button>
								        <button
								                class="btn btn-primary btn-sm px-3 shadow-sm" 
								                onclick="hoiAI('${ch.maCauHoi}')">
								            <i class="fas fa-save me-1"></i> Hỏi AI
								        </button>
								    </div>
								</div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <jsp:include page="../../components/footer.jsp" />

    <script>
    function checkAnswer(element, selectedOption) {
        const parent = element.parentElement;
        const questionId = parent.getAttribute('data-id');
        const correctAnswer = parent.getAttribute('data-correct');
        const questionText = document.getElementById('text-q-' + questionId).innerText;
        const selectedText = element.querySelector('.option-text').innerText;

        if (parent.classList.contains('answered')) return;
        parent.classList.add('answered');

        // Hiển thị màu đúng/sai
        if (selectedOption === correctAnswer) {
            element.classList.add('option-correct');
            element.innerHTML += ' <i class="fas fa-check-circle ms-auto text-success"></i>';
        } else {
            element.classList.add('option-wrong');
            element.innerHTML += ' <i class="fas fa-times-circle ms-auto text-danger"></i>';
        }
    }

    function saveNote(maId) {
        const textarea = document.getElementById('note-' + maId);
        const content = textarea.value.trim();

        fetch('${pageContext.request.contextPath}/User/GhiChu/Save', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'maCauHoi': maId,
                'noiDung': content
            })
        })
        .then(response => {
            if (response.ok) {
                alert("Lưu ghi chú câu " + maId + " thành công!");
            } else {
                alert("Lỗi: Không thể lưu. Có thể bạn chưa đăng nhập.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("Lỗi kết nối đến máy chủ.");
        });
    }
    function hoiAI(maId) {
        const cauHoi = document.getElementById('text-q-' + maId).innerText;
        
        const dsDapAn = document.querySelectorAll('.option-text-' + maId);
        
        let noiDungGuiDi = "Câu hỏi: " + cauHoi + "\n";
        let labels = ['A', 'B', 'C', 'D'];
        
        dsDapAn.forEach((item, index) => {
            noiDungGuiDi += labels[index] + ". " + item.innerText + "\n";
        });

        fetch('${pageContext.request.contextPath}/User/GhiChu/AskAI', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({
                'maCauHoi': maId,
                'prompt': noiDungGuiDi 
            })
        })
        .then(res => res.text()) 
        .then(data => {
            const textarea = document.getElementById('note-' + maId);
            textarea.value += "--- AI Trả lời ---\n" + data;
            
            const collapseEl = document.getElementById('collapseInfo-' + maId);
            new bootstrap.Collapse(collapseEl, { show: true });
        })
        .catch(err => alert("Lỗi kết nối AI!"));
    }
    </script>
</body>
</html>