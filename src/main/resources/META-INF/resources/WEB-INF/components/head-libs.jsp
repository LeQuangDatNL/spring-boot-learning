<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
    :root { 
        --primary-blue: #0066ff; 
        --bg-body: #f4f7fa; 
        --text-main: #2d3436;
        --text-muted: #636e72;
    }
    body { 
        background-color: var(--bg-body); 
        color: var(--text-main); 
        font-family: 'Inter', sans-serif; 
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .card { border: none; border-radius: 12px; }
    .btn-primary { background-color: var(--primary-blue); border: none; }
    .btn-primary:hover { background-color: #0052cc; }
</style>