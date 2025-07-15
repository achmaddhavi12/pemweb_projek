<?php
// ==== CORS ====
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Content-Type");

// ==== DB ====
include_once("../../config/db.php");

$id = $_GET['id'] ?? null;

if ($id) {
    $stmt = $conn->prepare("DELETE FROM kritik WHERE id = ?");
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo json_encode(["success" => true, "message" => "Kritik berhasil dihapus"]);
    } else {
        echo json_encode(["success" => false, "message" => "Gagal menghapus kritik"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "ID tidak ditemukan"]);
}
?>
