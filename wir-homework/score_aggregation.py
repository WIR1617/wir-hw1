import sys

# input file format
# Query ID \t DocID \t Rank \t Score

def fagin(k, ranking_dictionaries, ranking_lists):
    """Docstring"""

    seen = {}
    row = counter = 0

    while counter < k:
        for ranking_list in ranking_lists:
            doc_id, score = ranking_list[row]

            if doc_id not in seen:
                seen[doc_id] = [doc_id, score, 1]
            else:
                seen[doc_id][1] += score
                seen[doc_id][2] = 2
                counter += 1
        row += 1

    for doc_id, info in seen.items():
        if info[2] < 2:
            score = 0
            for ranking_dictionary in ranking_dictionaries:
                score += ranking_dictionary.get(doc_id, 0)

            seen[doc_id][1] = score

    return sorted(list(seen.values()), key=lambda x: x[1], reverse=True)[:k]

def threshold(k, ranking_dictionaries, ranking_lists):
    """Docstring"""
    return []

def aggregate_scores(algorithm_name, query_dictionaries, query_lists):
    """Docstring"""

    results = []

    if algorithm_name == "fagin":
        results = fagin(10, query_dictionaries, query_lists)

    elif algorithm_name == "threshold":
        results = threshold(10, query_dictionaries, query_lists)

    return results

def results_to_file(output_file, query_id, results):
    """Docstring"""
    for i in range(len(results)):
        line = str(query_id) \
            + "\t" + str(results[i][0]) \
            + "\t" + str(i+1) \
            + "\t" + str(results[i][1])

        print(line, file=output_file)

def get_line_entries(line):
    """Docstring"""

    line_entries = line.split('\t')

    query_id = int(line_entries[0])
    doc_id = int(line_entries[1])
    # rank = int(line_entries[2])
    score = float(line_entries[3])

    # return (query_id, doc_id, rank, score)
    return (query_id, doc_id, score)



def __main():

    # Check program arguments
    if len(sys.argv) < 5:
        print()
        print("Usage: \
            python score_aggregation \
            algorithm_name \
            output_file_name \
            file_name_1 file_name_2 ...")
        print()
        print("Example: \
            python score_aggregation \
            fagin \
            fagin.out \
            title.tsv text.tsv ...")
        return

    # Algorithm name must be either "fagin" or "threshold"
    algorithm_name = sys.argv[1].lower()
    if algorithm_name != "fagin" and algorithm_name != "threshold":
        print()
        print("Error: the algorithm must be either \"fagin\" or \"threshold\"")
        print("Error: exiting...")
        print()
        return

    # File names
    output_file_name = sys.argv[2]

    input_file_names = []
    for i in range(3, len(sys.argv)):
        input_file_names.append(sys.argv[i])

    # Open output file and write the first line
    output_file = open(output_file_name, "w")
    print("QueryID\tDocID\tRank\tScore", file=output_file)

    input_files = []
    for input_file_name in input_file_names:
        input_file = open(input_file_name)
        first_line = input_file.readline()
        if first_line != "Query_ID\tDoc_ID\tRank\tScore\n":
            print()
            print("Error: wrong format for " + input_file_name + "!")
            print("Error: exiting...")
            return
        input_files.append(input_file)

    current_query = 1
    query_dictionaries = []
    query_lists = []
    current_queries = []
    eofs = []

    for input_file in input_files:
        query_dictionaries.append({})
        query_lists.append([])
        current_queries.append(1)
        eofs.append(False)

    while eofs.count(False) > 1:

        for i in range(len(input_files)):
            if not eofs[i] and current_queries[i] == current_query:
                input_line = input_files[i].readline()
                if not input_line:
                    eofs[i] = True
                else:
                    (current_queries[i], doc_id, score) = get_line_entries(input_line)
                    query_dictionaries[i][doc_id] = score
                    query_lists[i].append((doc_id, score))

        if current_queries.count(current_query) == 0 or eofs.count(False) == 0:

            results = aggregate_scores(
                algorithm_name,
                query_dictionaries,
                query_lists
            )

            results_to_file(output_file, current_query, results)

            current_query = min(current_queries)

            query_dictionaries = []
            query_lists = []
            for input_file in input_files:
                query_dictionaries.append({})
                query_lists.append([])


__main()
