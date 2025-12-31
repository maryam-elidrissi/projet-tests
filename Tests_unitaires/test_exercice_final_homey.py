# Tests unitaires pour le systÃ¨me de gestion Homey - Ã€ complÃ©ter par les Ã©tudiants

import unittest
from exercice_final_homey import HomeyManager, Propriete

class TestHomeyManager(unittest.TestCase):
    """
    Classe de tests unitaires pour le systÃ¨me de gestion Homey.
    
    TODO: ComplÃ©tez les tests en utilisant toutes les assertions apprises :
    - assertEqual, assertTrue, assertFalse  
    - assertIsNone, assertIsNotNone
    - assertIn, assertNotIn
    - assertRaises
    """
    
    def setUp(self):
        """PrÃ©pare un HomeyManager et quelques propriÃ©tÃ©s de test avant chaque test."""
        # TODO: Initialiser self.manager et ajouter quelques propriÃ©tÃ©s de test
        
        
        self.manager = HomeyManager()
        self.manager.ajouter_propriete(1,"mariam",100)
        self.manager.ajouter_propriete(2, "Villa Plage", 200)
     
    # TODO: Tests pour ajouter_propriete()
    # 1. Test ajout propriÃ©tÃ© valide (assertEqual)
    def test_Ajouter(self):
        resultat =  self.manager.ajouter_propriete(3,"tanger",430)
        self.assertEqual(resultat.nom,"tanger")
        

    # 2. Test ajout propriÃ©tÃ© avec ID en double (assertRaises)
    def test_erreurID_en_double(self):
        with  self.assertRaises(ValueError):
            self.manager.ajouter_propriete(1,"test",123)
    # 3. Test ajout propriÃ©tÃ© avec prix nÃ©gatif (assertRaises)
    def test_erreur_prix_negatif(self):
       with self.assertRaises(ValueError):
           self.manager.ajouter_propriete(9,"mary",-6) 
    
    # TODO: Tests pour supprimer_propriete()
    # 4. Test suppression propriÃ©tÃ© existante (assertTrue)
    def test_delete(self):
        res = self.manager.supprimer_propriete(1)
        self.assertTrue(res)
    # 5. Test suppression propriÃ©tÃ© inexistante (assertFalse)
    def test_deletFalse(self):
        resultat = self.manager.supprimer_propriete(3)
        self.assertFalse(resultat)

    
    # TODO: Tests pour obtenir_propriete()
    # 6. Test obtention propriÃ©tÃ© existante (assertIsNotNone)
    def test_obtenir(self):
        resultat = self.manager.obtenir_propriete(2)
        self.assertIsNotNone(resultat)
        
    # 7. Test obtention propriÃ©tÃ© inexistante (assertIsNone)
    def test_obtenirNone(self):
        res= self.manager.obtenir_propriete(4)
        self.assertIsNone(res)
    
    # TODO: Tests pour rechercher_par_nom()
    # 8. Test recherche nom existant (assertIn)
    def test_rechercheNom(self):
        res = self.manager.rechercher_par_nom("mariam")
        self.assertIn("mariam",res[0].nom)

    # 9. Test recherche nom inexistant (liste vide)
    def test_rechercheNOM_inexist(self):
        res = self.manager.rechercher_par_nom("fatima")
        self.assertEqual(res,[])
    
    # TODO: Tests pour reserver_propriete()
    # 10. Test rÃ©servation valide (assertTrue)
    def test_reservation(self):
        res = self.manager.reserver_propriete(1)
        self.assertTrue(res)
    # 11. Test rÃ©servation propriÃ©tÃ© inexistante (assertFalse)
    def test_reservation_inexistant(self):
        res = self.manager.reserver_propriete(7)
        self.assertFalse(res)
    # 12. Test rÃ©servation propriÃ©tÃ© dÃ©jÃ  rÃ©servÃ©e (assertFalse)
        res = self.manager.reserver_propriete(5)
        self.assertFalse(res)
    
    # TODO: Tests pour les listes de propriÃ©tÃ©s
    # 13. Test obtenir propriÃ©tÃ©s disponibles (assertIn/assertNotIn)
    def test_disponible(self):
       prop1 = self.manager.obtenir_propriete(1)
       self.manager.reserver_propriete(2)  

       disponibles = self.manager.obtenir_proprietes_disponibles()
       self.assertIn(prop1, disponibles)

       prop2 = self.manager.obtenir_propriete(2)
       self.assertNotIn(prop2, disponibles)

    # 14. Test obtenir propriÃ©tÃ©s rÃ©servÃ©es (assertIn/assertNotIn)
    def test_obtenir_reservation(self):
         self.manager.reserver_propriete(1)

         reservees = self.manager.obtenir_proprietes_reservees()

         prop_reservee = self.manager.obtenir_propriete(1)
         prop_non_reservee = self.manager.obtenir_propriete(2)

         self.assertIn(prop_reservee, reservees)
         self.assertNotIn(prop_non_reservee, reservees)
          


if __name__ == "__main__":
    unittest.main() 