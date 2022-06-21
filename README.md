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
  - **Why some playstore apps are better than other** is a project that tries to understand, through data analysis, the different groups of *good apps*, their characteristics and why some playstore apps are better than others.

### Objectives
- Know the different groups of apps (groups based on shared characteristics such as category, price, etc.)
- Know more particular characteristics of different groups of apps. For example, the main developers involved in the development of the apps.
- Know particular cases of good apps.

### How to run the project
- #### Dataset 
  - First, you need to put the data in a directory called `dataset`. In the following [link](https://www.kaggle.com/datasets/gauthamp10/google-playstore-apps) you can download the dataset.

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

  - **Developers**
    - Description: The `developers` script filters the apss, groups the apps by different categories and counts how many developers have developed apps for each group.
    - How to use: 
      ```bash
        pig developers.pig
      ```

  - **Best apps**
    - Description: The `best apps` script selects the best free and ad-free app by category.
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

- **Developers**: The script generates results for various groups. For example, in particular the top 10 developers for free apps in the category `Tools` is the following:

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

- **Best apps*: The free and add-free apps for the top 10 categories (categories with most apps). 

| Category | Count | App | Rating|
|----------|------|------|-------|
| Finance|259|Мои налоги: личный кабинет. Оплата налогов по ИНН | 4.9 | 
| Education|211|"Жәннат Фирдаус - Намаз| Құран оқуды үйрену" | 5.0 |
| Shopping|196|InPost Mobile | 4.9 |
| Books & Reference|116|Babel Novel - Fantastic Books & Webnovel Reading | 5.0 |
| Health & Fitness|106|"Insight Timer - Meditation| Sleep| Music" | 4.9 |
| Tools|104|"Tasbeeh Counter: zikr| tasbih| zikirmatik" | 4.9 |
| Lifestyle|102|In Love while Parenting - Couples App |4.9 | 
| Travel & Local|85|"Tutu.ru - flights| Russian railway and bus tickets" | 4.9 |
| Productivity|79|GenshinDb | 4.9 |
| Business|73|Samsung Elite | 4.9 |





