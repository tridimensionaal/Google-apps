# Why some playstore apps are better than other 
---
## Contents:
  - [Description](#Description)
  - [Objectives](#Objectives)
  - [How to run the project](#How-to-run-the-project)
      - [Dataset](#Dataset)
      - [Docker](#Docker)
      - [Scripts](#Scripts)
  - [Results](#Results)
  
### Description
  - **Why some playstore apps are better than other** is a project that tries to understand, through data analysis, why some playstore apps are better than others.

### Objectives
- First objective
- Second objective
- Third objective

### How to run the project
- #### Dataset 
  - First, you need to have the dataset in ` directory. In the following [link](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps) you can download the dataset.

- #### Docker
  - The project uses Pig Latin, so if you don't want to install PigLatin on your PC, you can create a docker container with everything you need to run the project.
    ```bash
      docker build -t "patos:Dockerfile" .
    ```
  - The following command allows to enter to the created container.
    ```bash
      docker run -it "patos:Dockerfile"
    ```

- #### Scripts
  - **Best group apps**
    - Description: The `best group apps` script filter the apps, groups the apps by different categories and counts how many apps exist for each group.
    - How to use: 
      ```bash
        pig best_group_apps.pig
      ```

  - **Developers **
    - Description: The `Developers` script filters the apss, groups the apps by different categories and counts how many developers developed apps for each group.
    - How to use: 
      ```bash
        pig developers.pig
      ```

  - **Best apps**
    - Description: 
    - How to use: 
      ```bash
        pig best_apps.pig
      ```

### Results 
- **Best group apps**: The top 10 groups of apps are the following.

| Group apss                                  | Count |
|---------------------------------------------|-----------------------------|
|(Puzzle,(4.4, 4.6],Free,Ad supported,In app purchases)| 318 |
|Tools,(4.4, 4.6],Free,Ad supported,No in app purchases|290 | 
|Finance,(4.4, 4.6],Free,No ad supported,No in app purchases|240 |
|Tools,(4.4, 4.6],Free,Ad supported,In app purchases|237 | 
|Entertainment,(4.4, 4.6],Free,Ad supported,No in app purchases|191 |
|Casual,(4.4, 4.6],Free,Ad supported,In app purchases|182 | 
|Simulation,(4.4, 4.6],Free,Ad supported,In app purchases|180 |
|Personalization,(4.4, 4.6],Free,Ad supported,No in app purchases|166 |
|Arcade,(4.4, 4.6],Free,Ad supported,In app purchases|163 |
|Music & Audio,(4.4, 4.6],Free,Ad supported,No in app purchases|153 |

- **Developers**: The script generate results for various groups. For example, in particular the top 10 developers for free apps in the category `Tools` is the following:

| Developers | Count |
|----------|------| 
|Crone|8|
|Alef Network|7 |
|Desh Keyboards|7 |
|Pony Mobile|5 |
|Google LLC|5 |
|Lite Tools Studio|4 |
|InShot Inc.|4 |
|TunnelGuru|4 |
|Dourado Developer|4 |
|Free MCPE Addon|4 |

- Best group apps:


