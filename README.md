# XO Game with Flutter
เกม XO ที่สามารถปรับขนาดตารางได้และบันทึกประวัติการเล่นในแต่ละเกม โดยใช้ Flutter และการจัดการสถานะด้วย Provider เพื่อง่ายต่อการพัฒนาและจัดการสถานะของเกม


วิธีการรันโปรแกรม
หลังจากที่ดาวน์โหลดโปรเจกต์เสร็จ ให้เข้าไปในโฟลเดอร์โปรเจกต์และติดตั้ง dependencies ที่จำเป็น: flutter pub get

รันแอปบน Emulator หรือ Device ให้เปิด terminal หรือ command prompt แล้วเข้าไปในโฟลเดอร์โปรเจกต์ที่คุณดาวน์โหลดมา จากนั้นรันคำสั่ง: flutter run


ออกแบบโปรแกรม
1. โครงสร้างของโปรเจกต์
โปรเจกต์มีไฟล์หลักดังนี้:
main.dart: ไฟล์เริ่มต้นของแอปพลิเคชัน ใช้สำหรับการตั้งค่า Provider และแสดงหน้าหลักของเกม
game_provider.dart: ตัวจัดการสถานะของเกม ใช้สำหรับการจัดการกระดานเกม, ผู้เล่น, และการตรวจสอบผู้ชนะ
game_screen.dart: UI หลักของเกม ซึ่งแสดงหน้าจอเกม รวมถึงการแสดงประวัติการเล่น
board_tile.dart: ช่องของตารางเกม (XO) ซึ่งเป็นส่วนที่ผู้เล่นสามารถกดเพื่อเลือกการเคลื่อนไหว

2. การใช้ Provider
ใช้ Provider ในการจัดการสถานะเกม ซึ่งทำให้เราสามารถแบ่งแยก logic การเล่นและการแสดง UI ออกจากกันได้อย่างมีประสิทธิภาพ
GameProvider จะทำหน้าที่เก็บสถานะต่างๆ ของเกม รวมถึงกระดาน, ผู้เล่น, และประวัติการเล่น

3. UI การออกแบบ
หน้าจอหลักมีปุ่มให้ผู้ใช้เลือกขนาดกระดาน (3x3, 4x4, 5x5, 6x6)
กระดานเกมถูกสร้างโดยใช้ GridView.builder โดยที่แต่ละช่องสามารถคลิกได้เพื่อทำการเลือกตำแหน่ง
หน้าจอแสดงผลสถานะเกม เช่น ผู้เล่นปัจจุบันหรือผู้ชนะ
ประวัติการเล่นจะถูกเก็บและแสดงในลิสต์ด้านล่างของหน้าจอ
