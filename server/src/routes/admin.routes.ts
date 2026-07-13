import { Router } from 'express';
import { adminController } from '../controllers/admin.controller';
import { authMiddleware } from '../middleware/auth';
import { adminMiddleware } from '../middleware/admin';

const router = Router();

router.use(authMiddleware);
router.use(adminMiddleware);

// Dashboard
router.get('/stats', adminController.getStats);
router.get('/activity', adminController.getRecentActivity);

// Users
router.get('/users', adminController.getUsers);
router.get('/users/:id', adminController.getUserDetail);
router.put('/users/:id/balance', adminController.updateUserBalance);
router.delete('/users/:id', adminController.banUser);

// Characters
router.get('/characters', adminController.getCharacters);
router.get('/characters/:id', adminController.getCharacterDetail);
router.put('/characters/:id/toggle-public', adminController.toggleCharacterPublic);
router.delete('/characters/:id', adminController.deleteCharacter);

// Subscriptions
router.get('/subscriptions', adminController.getSubscriptions);

// Coin Transactions
router.get('/transactions', adminController.getCoinTransactions);

export default router;
